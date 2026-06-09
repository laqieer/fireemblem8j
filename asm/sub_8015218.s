	.syntax unified
	.section .text.sub_8015218, "ax", %progbits
@ sub_8015218 @ JP 0x08015218 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_8015218
	.thumb_func
sub_8015218:
	push {r4, r5, lr}
	lsls r1, r1, #0x10
	ldr r3, _0801525C @ =0x080DC15C
	movs r2, #0xff
	lsls r2, r2, #0x10
	ands r2, r1
	asrs r2, r2, #0x10
	adds r1, r2, #0
	adds r1, #0x40
	lsls r1, r1, #1
	adds r1, r1, r3
	movs r5, #0
	ldrsh r4, [r1, r5]
	lsls r2, r2, #1
	adds r2, r2, r3
	movs r1, #0
	ldrsh r2, [r2, r1]
	str r4, [r0]
	rsbs r1, r2, #0
	str r1, [r0, #4]
	movs r1, #0
	str r1, [r0, #8]
	str r2, [r0, #0xc]
	str r4, [r0, #0x10]
	str r1, [r0, #0x14]
	str r1, [r0, #0x18]
	str r1, [r0, #0x1c]
	movs r1, #0x80
	lsls r1, r1, #5
	str r1, [r0, #0x20]
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_0801525C: .4byte 0x080DC15C

