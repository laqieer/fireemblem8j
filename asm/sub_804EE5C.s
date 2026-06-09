	.syntax unified
	.set sub_8013008, 0x08013008 + 1
	.section .text.sub_804EE5C, "ax", %progbits
@ sub_804EE5C @ JP 0x0804EE5C - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_804EE5C
	.thumb_func
sub_804EE5C:
	push {lr}
	adds r3, r0, #0
	cmp r3, #0
	bne _0804EE68
	movs r3, #0xc0
	lsls r3, r3, #0x13
_0804EE68:
	ldr r2, _0804EE84 @ =0x085E0640
	ldr r0, _0804EE88 @ =0x0202BCEC
	adds r0, #0x41
	ldrb r1, [r0]
	movs r0, #0xc
	ands r0, r1
	adds r0, r0, r2
	ldr r0, [r0]
	adds r1, r3, #0
	bl sub_8013008
	pop {r0}
	bx r0
	.align 2, 0
_0804EE84: .4byte 0x085E0640
_0804EE88: .4byte 0x0202BCEC

