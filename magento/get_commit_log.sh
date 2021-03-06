#!/usr/bin/env bash
# magento 1 uses git, so we may use git log -1
# magento 2 uses composer, so we may use composer show mailchimp/mc-magento2
# we can refine the response using grep

locations () {
    magento21='/var/www/magento221'
    magento22='/var/www/magento222'
    magento23='/var/www/magento223'
    magento24='/var/www/magento224'
    magento1='/var/www/magento'
}

magento21 () {
    magento21='/var/www/magento221'
    cd $magento21
    composer_output="$(composer show mailchimp/mc-magento2 | grep 'source')"
    composer_output_commit=${composer_output:61}
    echo "Magento 2.1:" $composer_output_commit
}

magento22 () {
    magento22='/var/www/magento222'
    cd $magento22
    composer_output="$(composer show mailchimp/mc-magento2 | grep 'source')"
    composer_output_commit=${composer_output:61}
    echo "Magento 2.2:" $composer_output_commit
}

magento23 () {
    magento23='/var/www/magento223'
    cd $magento23
    composer_output="$(composer show mailchimp/mc-magento2 | grep 'source')"
    composer_output_commit=${composer_output:61}
    echo "Magento 2.3:" $composer_output_commit
}

magento24 () {
    magento24='/var/www/magento224'
    cd $magento23
    composer_output="$(composer show mailchimp/mc-magento2 | grep 'source')"
    composer_output_commit=${composer_output:61}
    echo "Magento 2.4:" $composer_output_commit
}

magento1 () {
    magento1='/var/www/magento'
    cd $magento1
    git_output="$(sudo git log -1 | grep 'commit')" # ownership conflict without sudo
    git_output_commit=${git_output:7}
    echo "Magento 1.9:" $git_output_commit
}

get_commits() {
    printf "Hello! *waves* \nHere are the latest commits I've found...\n\n"
    magento1
    magento21
    magento22
    magento23
    magento24
}

get_commits
