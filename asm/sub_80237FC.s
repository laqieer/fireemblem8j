	.syntax unified
	.set EndFaceById, 0x08005660 + 1
	.set sub_8022F50, 0x08022F50 + 1
	.set sub_80234FC, 0x080234FC + 1
	.section .text.sub_80237FC, "ax", %progbits
@ sub_80237FC @ JP 0x080237FC - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_80237FC
	.thumb_func
sub_80237FC:
	push {r4, r5, lr}
	adds r4, r0, #0
	adds r5, r1, #0
	ldr r0, _08023828 @ =0x0202BCAC
	ldr r1, _0802382C @ =0x0203A954
	ldrb r1, [r1, #0x12]
	adds r0, #0x3f
	strb r1, [r0]
	adds r0, r4, #0
	bl sub_80234FC
	movs r0, #0
	bl EndFaceById
	adds r0, r4, #0
	adds r1, r5, #0
	bl sub_8022F50
	movs r0, #1
	pop {r4, r5}
	pop {r1}
	bx r1
	.align 2, 0
_08023828: .4byte 0x0202BCAC
_0802382C: .4byte 0x0203A954

