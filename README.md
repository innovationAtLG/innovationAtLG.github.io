## FX Team Website

**FX Bloggers**

To post a new blog post, please follow the steps below:

1. Clone the website in git: **git clone --recursive- submodules https://github.com/innovationAtLG/innovationAtLG.github.io.git** 
2. Checkout **source** branch.
3. Create a new branch with the name **blog/<your_name>**
4. In the **content/blog** folder, add the markdown version of your blogpost.
    * Please follow the naming convention: **Date_Title.md**
    * Be sure to include all the metadata, as done in the previous posts:
        1. title: “My Title”
        2. date: "2020-10-05T12:14:34+06:00"
        3. images: ["/images/blog/bPost#_Img-#.png"]
        4. image: "/images/blog/bPost#_Img-#.png"
        5. description: “My short 1-2 sentence description of my blog.”
        6. author: “My Name”
5. In the **static/images/blog** folder, add your images.
    * Please follow the naming convention: **bPost#_Img-#.png**
6. Update the image location in the md version of your blog using a text editor.
7. Go to git and type in the **hugo server** command.
8. Review updates on **localhost:1313**
9. If everything is good to go: add the changes to git.
10. Commit changes on git with a message about adding your blog.
11. Push changes to github on **your branch.**
12. Create a pull request for **source** branch, and notify an admin to that your pull request is ready.


**FX Website Admin**
1. Check over changes on merge request.
2. Approve or notify blogger of necessary changes to complete merge request on **source** branch.
3. Commit changes to **source** branch.
4. Run **./deploy.sh "commit msg."**
5. Master branch will update if successful, and changes will be live after some time on our [website](https://innovationatlg.github.io/).

**Blog Development**
1. Checkout **source** branch.
2. Create a new branch to **feature/<feature_name>** and checkout your branch.
3. Test Locally using **hugo server** command.
4. Create a pull request to **source** branch.
5. Notify Reviewer/Admin.
