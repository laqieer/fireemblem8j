	.syntax unified
	.set sub_8002DE4, 0x08002DE4 + 1
	.section .text.sub_8065278, "ax", %progbits
@ sub_8065278 @ JP 0x08065278 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_8065278
	.thumb_func
sub_8065278:
	push {r4, r5, r6, r7, lr}
	adds r4, r0, #0
	ldr r5, [r4, #0x60]
	movs r3, #0x32
	movs r1, #0x80
	lsls r1, r1, #2
	adds r0, r1, #0
	ldrh r2, [r4, #0x30]
	adds r0, r0, r2
	movs r6, #0
	strh r0, [r4, #0x30]
	ldrh r1, [r4, #0x30]
	lsrs r1, r1, #8
	ldr r2, _080652F4 @ =0x080DC15C
	lsls r0, r1, #1
	adds r0, r0, r2
	movs r7, #0
	ldrsh r0, [r0, r7]
	adds r1, #0x40
	lsls r1, r1, #1
	adds r1, r1, r2
	movs r2, #0
	ldrsh r1, [r1, r2]
	muls r0, r3, r0
	muls r1, r3, r1
	asrs r0, r0, #0xc
	ldrh r7, [r4, #0x32]
	adds r0, r0, r7
	asrs r1, r1, #0xc
	ldrh r2, [r4, #0x3a]
	adds r1, r1, r2
	strh r0, [r5, #2]
	strh r1, [r5, #4]
	ldrh r0, [r4, #0x2c]
	adds r0, #1
	strh r0, [r4, #0x2c]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #0x3c
	ble _080652CC
	movs r0, #0x3c
	strh r0, [r4, #0x2c]
_080652CC:
	ldrh r0, [r4, #0x2e]
	adds r0, #1
	strh r0, [r4, #0x2e]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #0x3c
	ble _080652EC
	strh r6, [r4, #0x2c]
	strh r6, [r4, #0x2e]
	ldr r0, _080652F8 @ =0x0875ABFC
	str r0, [r5, #0x24]
	str r0, [r5, #0x20]
	strh r6, [r5, #6]
	adds r0, r4, #0
	bl sub_8002DE4
_080652EC:
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080652F4: .4byte 0x080DC15C
_080652F8: .4byte 0x0875ABFC

