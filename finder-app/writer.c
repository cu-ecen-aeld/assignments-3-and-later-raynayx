#include <stdio.h>
#include <stdlib.h>
#include <syslog.h>
#include <errno.h>


int main(int argc, char **argv)
{

    if(argc != 3)
    {
        fprintf(stderr,"Usage %s <file> <writeString>\n",argv[0]);
        exit(EXIT_FAILURE);
    }

    const char *path = argv[1];
    const char *writeStr = argv[2];

    printf("%s::%s\n",argv[1],argv[2]);

    openlog(argv[0], LOG_PID | LOG_CONS, LOG_USER);

    FILE *fp = fopen(path,"w");

    if(!fp)
    {
        syslog(LOG_ERR, "Failed to open file %s for writting: %m",path);
        closelog();
        exit(EXIT_FAILURE);
    }

    if(fprintf(fp,"%s",writeStr) < 0)
    {
        syslog(LOG_ERR,"Failed to write to file %s: %m", path);
        fclose(fp);
        closelog();
        exit(EXIT_FAILURE);
    }


    syslog(LOG_DEBUG,"Writing %s to %s", writeStr, path);
    fclose(fp);
    closelog();

    return EXIT_SUCCESS;
}