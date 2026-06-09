	.syntax unified
	.set sub_8002DE4, 0x08002DE4 + 1
	.set sub_8056130, 0x08056130 + 1
	.set sub_8056214, 0x08056214 + 1
	.section .text.sub_805DDF8, "ax", %progbits
@ sub_805DDF8 @ JP 0x0805DDF8 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_805DDF8
	.thumb_func
sub_805DDF8:
	push {r4, lr}
	adds r4, r0, #0
	ldrh r0, [r4, #0x2c]
	adds r0, #1
	strh r0, [r4, #0x2c]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	movs r2, #0x2e
	ldrsh r1, [r4, r2]
	cmp r0, r1
	bne _0805DE24
	bl sub_8056130
	ldr r1, _0805DE2C @ =0x0201774C
	ldr r0, [r1]
	subs r0, #1
	str r0, [r1]
	bl sub_8056214
	adds r0, r4, #0
	bl sub_8002DE4
_0805DE24:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0805DE2C: .4byte 0x0201774C

