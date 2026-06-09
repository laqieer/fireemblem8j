	.syntax unified
	.set Proc_Goto, 0x08002E74 + 1
	.section .text.sub_80098F0, "ax", %progbits
@ sub_80098F0 @ JP 0x080098F0 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_80098F0
	.thumb_func
sub_80098F0:
	push {lr}
	adds r2, r0, #0
	ldr r0, _08009910 @ =0x085775CC
	ldr r0, [r0]
	ldrh r1, [r0, #4]
	movs r0, #0x85
	lsls r0, r0, #2
	cmp r1, r0
	bne _0800990A
	adds r0, r2, #0
	movs r1, #0x11
	bl Proc_Goto
_0800990A:
	pop {r0}
	bx r0
	.align 2, 0
_08009910: .4byte 0x085775CC

