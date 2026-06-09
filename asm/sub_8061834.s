	.syntax unified
	.set sub_8002DE4, 0x08002DE4 + 1
	.set sub_8056774, 0x08056774 + 1
	.set sub_805679C, 0x0805679C + 1
	.section .text.sub_8061834, "ax", %progbits
@ sub_8061834 @ JP 0x08061834 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_8061834
	.thumb_func
sub_8061834:
	push {r4, lr}
	adds r1, r0, #0
	ldr r2, [r1, #0x60]
	ldrh r0, [r1, #0x2c]
	adds r0, #1
	movs r4, #0
	strh r0, [r1, #0x2c]
	lsls r0, r0, #0x10
	asrs r3, r0, #0x10
	cmp r3, #1
	bne _08061878
	ldr r0, _0806186C @ =0x0867E9B8
	str r0, [r2, #0x24]
	str r0, [r2, #0x20]
	strh r4, [r2, #6]
	movs r0, #0xa
	strh r0, [r1, #0x2e]
	ldr r0, _08061870 @ =0x0867E214
	movs r1, #0x20
	bl sub_805679C
	ldr r0, _08061874 @ =0x0867DE18
	movs r1, #0x80
	lsls r1, r1, #5
	bl sub_8056774
	b _08061888
	.align 2, 0
_0806186C: .4byte 0x0867E9B8
_08061870: .4byte 0x0867E214
_08061874: .4byte 0x0867DE18
_08061878:
	movs r2, #0x2e
	ldrsh r0, [r1, r2]
	cmp r3, r0
	bne _08061888
	strh r4, [r1, #0x2c]
	adds r0, r1, #0
	bl sub_8002DE4
_08061888:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0

