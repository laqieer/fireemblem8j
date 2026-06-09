	.syntax unified
	.section .text.sub_800DC40, "ax", %progbits
@ sub_800DC40 @ JP 0x0800DC40 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_800DC40
	.thumb_func
sub_800DC40:
	push {r4, r5, r6, lr}
	adds r4, r0, #0
	ldr r0, [r4, #0x38]
	ldrh r2, [r0, #4]
	ldrh r0, [r0, #6]
	lsls r0, r0, #0x10
	orrs r2, r0
	cmp r2, #0
	bge _0800DC56
	ldr r0, _0800DC8C @ =0x030004B0
	ldr r2, [r0, #8]
_0800DC56:
	ldr r5, _0800DC90 @ =0x03000568
	movs r3, #0xc0
	lsls r3, r3, #0x13
	adds r1, r5, #0
	adds r1, #0x30
	movs r6, #0xff
	lsls r6, r6, #0x18
_0800DC64:
	ldr r0, [r1]
	str r0, [r1, #8]
	ldr r0, [r1, #4]
	str r0, [r1, #0xc]
	adds r0, r3, #0
	adds r3, r3, r6
	subs r1, #8
	asrs r0, r0, #0x18
	cmp r0, #0
	bgt _0800DC64
	ldr r0, [r4, #0x34]
	str r0, [r5]
	ldr r0, [r4, #0x38]
	str r0, [r5, #4]
	str r2, [r4, #0x34]
	str r2, [r4, #0x38]
	movs r0, #4
	pop {r4, r5, r6}
	pop {r1}
	bx r1
	.align 2, 0
_0800DC8C: .4byte 0x030004B0
_0800DC90: .4byte 0x03000568

