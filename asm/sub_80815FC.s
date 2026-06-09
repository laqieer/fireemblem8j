	.syntax unified
	.set sub_8000D68, 0x08000D68 + 1
	.section .text.sub_80815FC, "ax", %progbits
@ sub_80815FC @ JP 0x080815FC - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_80815FC
	.thumb_func
sub_80815FC:
	push {r4, r5, lr}
	adds r5, r0, #0
	ldr r1, _08081648 @ =0x08A1CC54
	ldr r0, [r5, #0x54]
	adds r4, r0, #1
	str r4, [r5, #0x54]
	movs r0, #3
	ands r0, r4
	cmp r0, #0
	bne _08081642
	asrs r4, r4, #2
	movs r0, #0xf
	ands r4, r0
	lsls r4, r4, #1
	adds r4, r4, r1
	adds r5, #0x64
	movs r0, #0
	ldrsh r1, [r5, r0]
	adds r1, #0x10
	lsls r1, r1, #5
	adds r1, #0x12
	adds r0, r4, #0
	movs r2, #0xe
	bl sub_8000D68
	adds r4, #0x40
	movs r0, #0
	ldrsh r1, [r5, r0]
	adds r1, #0x11
	lsls r1, r1, #5
	adds r1, #0x12
	adds r0, r4, #0
	movs r2, #0xe
	bl sub_8000D68
_08081642:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_08081648: .4byte 0x08A1CC54

