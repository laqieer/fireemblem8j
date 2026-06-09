	.syntax unified
	.set Proc_Goto, 0x08002E74 + 1
	.set m4aSongNumStart, 0x080D4EF4 + 1
	.section .text.sub_80974F0, "ax", %progbits
@ sub_80974F0 @ JP 0x080974F0 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_80974F0
	.thumb_func
sub_80974F0:
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, _0809751C @ =0x0202BCEC
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt _08097506
	movs r0, #0x6a
	bl m4aSongNumStart
_08097506:
	adds r1, r4, #0
	adds r1, #0x33
	movs r0, #3
	strb r0, [r1]
	adds r0, r4, #0
	movs r1, #8
	bl Proc_Goto
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0809751C: .4byte 0x0202BCEC

