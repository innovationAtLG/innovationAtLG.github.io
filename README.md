## [FX Team Website](https://innovationatlg.github.io/)

The FX website is our face to the world. It's a chance for us publish what we're wokring on to the world. The site is hosted on at [https://innovationatlg.github.io/](https://innovationatlg.github.io/)

The site is created via static site generator called Hugo. This allows us to keep the design and the content seperated.

We hope you add you talent to the blog and help us keep this up to date. 
_-FX Team_


## Getting started:
The blog uses a submodule for theme. You need to pul this down the first time.

The first time you need to clone the website in git:
```git clone --recursive- submodules https://github.com/innovationAtLG/innovationAtLG.github.io.git** ```

## FX Bloggers

To post a new blog post, please follow the steps below:

1. Checkout **source** branch.
1. Create a new branch with the name **blog/<your_name>**
1. In the **content/blog** folder, add the markdown version of your blogpost.
    * Please follow the naming convention: **Date_Title.md**
    * Be sure to include all the metadata, as done in the previous posts:
        ```
        title: “My Title”
        date: "2020-10-05T12:14:34+06:00"
        images: ["/images/blog/bPost#_Img-#.png"]
        image: "/images/blog/bPost#_Img-#.png"
        description: “My short 1-2 sentence description of my blog.”
        author: “My Name”
        ```
1. In the `static/images/blog` folder, add your images.
    * Please follow the naming convention: **`bPost#_Img-#.png`**
1. Update the image location in the md version of your blog using a text editor.
1. Go to git and type in the `hugo server` command.
1. Review updates on `localhost:1313`
1. If everything is good to go: add the changes to git.
1. Commit changes on git with a message about adding your blog.
1. Push changes to github on **your branch.**
1. Create a pull request for **`source`** branch, and notify an admin to that your pull request is ready.


## FX Website Administration

1. Test the Pull request on your local machine
    1. Get the Pull request locally with ` git fetch REMOTE pull/PRNUMBER/head:BRANCHNAME`  _(You need supply the items in ALL CAPS.)_
    2. Check it out with `hugo serve` and on your localhost.
1. If everything looks good - Approve and complete merge request on Github.
    1. If not notify blogger of necessary changes
1. Commit changes to **`source`** branch.
1. Run `./publish.sh`
1. **master** branch will update if successful, and changes will be live after some time on our [website](https://innovationatlg.github.io/).

## Blog Development

1. Checkout `source` branch.
2. Create a new branch to `feature/<feature_name>` and checkout your branch.
3. Test Locally using `hugo server` command.
4. Create a pull request to `source` branch.
5. Notify Reviewer/Admin.
