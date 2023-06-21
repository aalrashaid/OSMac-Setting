To set up primary-secondary replication for MySQL server on DigitalOcean, you can follow these steps:

1. Create two Droplets: Log in to your DigitalOcean account and create two Droplets. One will serve as the primary server, and the other will be the secondary server.

2. Install MySQL: Connect to each Droplet using SSH and install MySQL on both servers. You can follow the MySQL installation instructions for your specific operating system.

3. Configure the primary server: Open the MySQL configuration file on the primary server using a text editor. The file location may vary depending on your operating system, but it is typically located at `/etc/mysql/mysql.conf.d/mysqld.cnf`. Look for the `bind-address` directive and set it to the primary server's private IP address. Save the file and restart the MySQL service.

4. Configure the secondary server: Similarly, open the MySQL configuration file on the secondary server and set the `bind-address` directive to the secondary server's private IP address. Save the file and restart the MySQL service.

5. Create a replication user on the primary server: Log in to the primary server's MySQL console using the `mysql` command and create a replication user with the appropriate privileges. Run the following commands:

   ```sql
   CREATE USER 'replication_user'@'%' IDENTIFIED BY 'replication_password';
   GRANT REPLICATION SLAVE ON *.* TO 'replication_user'@'%';
   FLUSH PRIVILEGES;
   ```

   This creates a replication user named `replication_user` with the password `replication_password` and grants the necessary replication privileges.

6. Take a backup of the primary database: On the primary server, use the `mysqldump` command to create a backup of the primary database:

   ```bash
   mysqldump --single-transaction --master-data=2 --all-databases > primary_backup.sql
   ```

   This command creates a backup file named `primary_backup.sql` that contains all the databases and includes the necessary information for replication.

7. Import the backup on the secondary server: Transfer the backup file (`primary_backup.sql`) from the primary server to the secondary server. On the secondary server, import the backup using the following command:

   ```bash
   mysql < primary_backup.sql
   ```

   This imports the backup and restores the databases on the secondary server.

8. Configure the secondary server to replicate from the primary: On the secondary server, log in to the MySQL console and run the following commands:

   ```sql
   CHANGE MASTER TO
     MASTER_HOST='primary_server_private_ip',
     MASTER_USER='replication_user',
     MASTER_PASSWORD='replication_password',
     MASTER_AUTO_POSITION=1;
   ```

   Replace `primary_server_private_ip` with the private IP address of the primary server.

9. Start replication on the secondary server: Execute the following command on the secondary server's MySQL console:

   ```sql
   START SLAVE;
   ```

   This starts the replication process, and the secondary server will begin syncing with the primary server.

10. Monitor the replication status: You can use the following command on the secondary server to check the replication status:

    ```sql
    SHOW SLAVE STATUS\G
    ```

    Look for the `Slave_IO_Running` and `Slave_SQL_Running` fields. If both show `Yes`, it means replication is working correctly.

By following these steps, you can set up primary-secondary replication for MySQL server on DigitalOcean. Remember to replace `primary_server_private_ip`, `replication_user`, and `replication_password` with your specific values.