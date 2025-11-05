import { motion } from "framer-motion";
import { ExternalLink, Trophy, Code2, Target, Award } from "lucide-react";
import { Card } from "@/components/ui/card";
import { Button } from "@/components/ui/button";

const CodingProfiles = () => {
  const profiles = [
    {
      platform: "LeetCode",
      icon: Code2,
      username: "@dharmenthiran",
      stats: {
        solved: "450+",
        rank: "Top 5%",
        contests: "25",
      },
      link: "https://leetcode.com",
      color: "primary",
    },
    {
      platform: "GitHub",
      icon: Code2,
      username: "@dharmenthiran-t",
      stats: {
        repos: "50+",
        stars: "200+",
        contributions: "1000+",
      },
      link: "https://github.com",
      color: "secondary",
    },
    {
      platform: "HackerRank",
      icon: Trophy,
      username: "@dharmenthiran",
      stats: {
        stars: "5 ⭐",
        badges: "25+",
        rank: "Gold",
      },
      link: "https://hackerrank.com",
      color: "accent",
    },
    {
      platform: "CodeChef",
      icon: Target,
      username: "@dharmen_t",
      stats: {
        rating: "1850",
        stars: "4 ⭐",
        problems: "200+",
      },
      link: "https://codechef.com",
      color: "primary",
    },
  ];

  const achievements = [
    {
      icon: Award,
      title: "Global Rank #250",
      platform: "LeetCode Weekly Contest",
      date: "2024",
    },
    {
      icon: Trophy,
      title: "Problem Solving (Gold)",
      platform: "HackerRank",
      date: "2023",
    },
    {
      icon: Code2,
      title: "Open Source Contributor",
      platform: "GitHub",
      date: "2022-2024",
    },
  ];

  const containerVariants = {
    hidden: { opacity: 0 },
    visible: {
      opacity: 1,
      transition: {
        staggerChildren: 0.1,
      },
    },
  };

  const itemVariants = {
    hidden: { opacity: 0, scale: 0.8 },
    visible: { opacity: 1, scale: 1 },
  };

  return (
    <div className="min-h-screen pt-32 pb-20">
      <div className="container mx-auto px-4">
        <motion.div
          initial={{ opacity: 0, y: -20 }}
          animate={{ opacity: 1, y: 0 }}
          className="text-center mb-16"
        >
          <h1 className="text-5xl md:text-6xl font-bold mb-4">
            <span className="gradient-text">Coding Profiles</span>
          </h1>
          <p className="text-xl text-muted-foreground max-w-2xl mx-auto">
            My journey across various competitive programming platforms and open source contributions
          </p>
        </motion.div>

        {/* Profiles Grid */}
        <motion.div
          variants={containerVariants}
          initial="hidden"
          animate="visible"
          className="grid md:grid-cols-2 gap-6 max-w-4xl mx-auto mb-16"
        >
          {profiles.map((profile, index) => (
            <motion.div key={index} variants={itemVariants}>
              <Card className="glass p-6 hover:glow-primary transition-all duration-300 group">
                <div className="flex items-start justify-between mb-6">
                  <div className="flex items-center gap-3">
                    <div className={`p-3 rounded-lg bg-${profile.color}/20 glow-${profile.color} group-hover:scale-110 transition-transform`}>
                      <profile.icon className={`h-6 w-6 text-${profile.color}`} />
                    </div>
                    <div>
                      <h3 className="text-xl font-bold">{profile.platform}</h3>
                      <p className="text-sm text-muted-foreground">{profile.username}</p>
                    </div>
                  </div>
                  <Button
                    size="sm"
                    variant="ghost"
                    className="hover:bg-primary/10"
                    asChild
                  >
                    <a href={profile.link} target="_blank" rel="noopener noreferrer">
                      <ExternalLink className="h-4 w-4" />
                    </a>
                  </Button>
                </div>

                <div className="grid grid-cols-3 gap-4">
                  {Object.entries(profile.stats).map(([key, value]) => (
                    <div key={key} className="text-center">
                      <p className="text-2xl font-bold text-primary">{value}</p>
                      <p className="text-xs text-muted-foreground capitalize">{key}</p>
                    </div>
                  ))}
                </div>
              </Card>
            </motion.div>
          ))}
        </motion.div>

        {/* Achievements Section */}
        <motion.div
          initial={{ opacity: 0, y: 20 }}
          animate={{ opacity: 1, y: 0 }}
          transition={{ delay: 0.6 }}
          className="max-w-4xl mx-auto"
        >
          <h2 className="text-3xl font-bold mb-8 text-center">
            <span className="gradient-text">Key Achievements</span>
          </h2>
          <div className="grid md:grid-cols-3 gap-6">
            {achievements.map((achievement, index) => (
              <motion.div
                key={index}
                initial={{ opacity: 0, y: 20 }}
                animate={{ opacity: 1, y: 0 }}
                transition={{ delay: 0.8 + index * 0.1 }}
              >
                <Card className="glass p-6 text-center hover:glow-secondary transition-all duration-300">
                  <div className="flex justify-center mb-4">
                    <div className="p-4 rounded-full bg-secondary/20 glow-secondary">
                      <achievement.icon className="h-8 w-8 text-secondary" />
                    </div>
                  </div>
                  <h3 className="font-bold mb-2">{achievement.title}</h3>
                  <p className="text-sm text-muted-foreground mb-1">{achievement.platform}</p>
                  <p className="text-xs text-muted-foreground">{achievement.date}</p>
                </Card>
              </motion.div>
            ))}
          </div>
        </motion.div>
      </div>
    </div>
  );
};

export default CodingProfiles;
