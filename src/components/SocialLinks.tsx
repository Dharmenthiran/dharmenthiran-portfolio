import { motion } from "framer-motion";
import { Github, Linkedin, Twitter, Instagram, Mail } from "lucide-react";

const SocialLinks = () => {
  const socials = [
    { icon: Github, link: "https://github.com", label: "GitHub" },
    { icon: Linkedin, link: "https://linkedin.com", label: "LinkedIn" },
    { icon: Twitter, link: "https://twitter.com", label: "Twitter" },
    { icon: Instagram, link: "https://instagram.com", label: "Instagram" },
    { icon: Mail, link: "mailto:dharmenthiran@example.com", label: "Email" },
  ];

  return (
    <motion.div
      initial={{ opacity: 0, x: -50 }}
      animate={{ opacity: 1, x: 0 }}
      transition={{ delay: 1 }}
      className="fixed left-8 bottom-0 hidden lg:flex flex-col items-center gap-6 z-40"
    >
      {socials.map((social, index) => (
        <motion.a
          key={social.label}
          href={social.link}
          target="_blank"
          rel="noopener noreferrer"
          initial={{ opacity: 0, y: 20 }}
          animate={{ opacity: 1, y: 0 }}
          transition={{ delay: 1.2 + index * 0.1 }}
          whileHover={{ scale: 1.2, y: -5 }}
          className="p-3 rounded-lg glass hover:glow-primary transition-all duration-300 group"
          aria-label={social.label}
        >
          <social.icon className="h-5 w-5 text-foreground group-hover:text-primary transition-colors" />
        </motion.a>
      ))}
      <div className="w-px h-24 bg-gradient-to-b from-primary to-transparent" />
    </motion.div>
  );
};

export default SocialLinks;
