	.syntax unified
	.set sub_8002DE4, 0x08002DE4 + 1
	.set sub_806FF20, 0x0806FF20 + 1
	.set sub_8073E74, 0x08073E74 + 1
	.set sub_8073F94, 0x08073F94 + 1
	.section .text.sub_806FED4, "ax", %progbits
@ sub_806FED4 @ JP 0x0806FED4 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_806FED4
	.thumb_func
sub_806FED4:
	push {r4, r5, lr}
	adds r5, r0, #0
	ldrh r0, [r5, #0x2c]
	adds r0, #1
	strh r0, [r5, #0x2c]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #0x11
	bne _0806FF0A
	ldr r0, [r5, #0x5c]
	movs r1, #0x49
	bl sub_806FF20
	movs r4, #0xa0
	lsls r4, r4, #1
	movs r1, #0x80
	lsls r1, r1, #1
	adds r0, r4, #0
	bl sub_8073E74
	ldr r0, [r5, #0x5c]
	movs r2, #2
	ldrsh r1, [r0, r2]
	adds r0, r4, #0
	movs r2, #1
	bl sub_8073F94
_0806FF0A:
	movs r1, #0x2c
	ldrsh r0, [r5, r1]
	cmp r0, #0x64
	bne _0806FF18
	adds r0, r5, #0
	bl sub_8002DE4
_0806FF18:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0

