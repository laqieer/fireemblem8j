	.syntax unified
	.set SetActiveClassReelSpell, 0x08070EFC + 1
	.set sub_8002BCC, 0x08002BCC + 1
	.section .text.sub_8071608, "ax", %progbits
@ sub_8071608 @ JP 0x08071608 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_8071608
	.thumb_func
sub_8071608:
	push {r4, r5, lr}
	adds r5, r0, #0
	ldr r0, _08071630 @ =0x08603CC8
	movs r1, #3
	bl sub_8002BCC
	adds r4, r0, #0
	bl SetActiveClassReelSpell
	str r5, [r4, #0x5c]
	movs r0, #0
	strh r0, [r4, #0x2c]
	str r0, [r4, #0x44]
	ldr r0, _08071634 @ =0x080E4B28
	str r0, [r4, #0x48]
	ldr r0, _08071638 @ =0x0869CCAC
	str r0, [r4, #0x4c]
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_08071630: .4byte 0x08603CC8
_08071634: .4byte 0x080E4B28
_08071638: .4byte 0x0869CCAC

