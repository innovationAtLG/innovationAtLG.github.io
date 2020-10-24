## FX Team Website

**FX Bloggers**

To post a new blog post, please follow the steps below:

1. In git, checkout **source** branch.
2. Create a new branch with the name **blog/<your_name>**
2. In the **content/blog** folder, add the markdown version of your blogpost.
    * Please follow the naming convention: **Date_Title.md**
    * Be sure to include all the metadata, as done in the previous posts:
        1. title: “My Title”
        2. date: "2020-10-05T12:14:34+06:00"
        3. images: ["/images/blog/bPost#_Img-#.png"]
        4. image: "/images/blog/bPost#_Img-#.png"
        5. description: “My short 1-2 sentence description of my blog.”
        6. author: “My Name”
3. In the **static/images/blog** folder, add your images.
    * Please follow the naming convention: **bPost#_Img-#.png**
4. Update the image location in the md version of your blog using a text editor.
5. Go to git and type in the **hugo server** command.
6. Review updates on **localhost:1313**
7. If everything is good to go: add the changes to git.
8. Commit changes on git with a message about adding your blog.
9. Push changes to github on **your branch.**
10. Create a pull request for **source** branch.
11. Notify an admin to that your pull request is ready.


**FX Website Admin**
1. Check over changes on merge request.
2. Approve or notify blogger of necessary changes to complete merge request on **source** branch.
3. Commit changes to **source** branch.
4. Run **./deploy.sh "commit msg."**
5. Master branch will update if successful, and changes will be live after some time on our [website](https://innovationatlg.github.io/).

**Blog Development**
1. Checkout **Source**
2. Branch to **feature/<feature_name>** 
3. Test Locally
4. Pull request to **source**
5. Notify Reviewer
