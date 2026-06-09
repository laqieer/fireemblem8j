	.syntax unified
	.section .text.GetTalkPauseCmdDuration, "ax", %progbits
@ GetTalkPauseCmdDuration @ JP 0x08008094 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global GetTalkPauseCmdDuration
	.thumb_func
GetTalkPauseCmdDuration:
	ldr r1, _080080A0 @ =0x085B92B8
	subs r0, #4
	lsls r0, r0, #2
	adds r0, r0, r1
	ldr r0, [r0]
	bx lr
	.align 2, 0
_080080A0: .4byte 0x085B92B8

