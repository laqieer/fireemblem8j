	.syntax unified
	.set sub_80D636C, 0x080D636C + 1
	.set sub_80D6370, 0x080D6370 + 1
	.section .text.sub_8000D68, "ax", %progbits
@ sub_8000D68 @ JP 0x08000D68 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_8000D68
	.thumb_func
sub_8000D68:
	push {r4, lr}
	adds r4, r0, #0
	adds r3, r2, #0
	movs r0, #0x1f
	ands r0, r3
	cmp r0, #0
	beq _08000D94
	asrs r1, r1, #1
	lsls r1, r1, #1
	ldr r0, _08000D90 @ =0x020228A8
	adds r1, r1, r0
	lsrs r2, r3, #0x1f
	adds r2, r3, r2
	lsls r2, r2, #0xa
	lsrs r2, r2, #0xb
	adds r0, r4, #0
	bl sub_80D6370
	b _08000DAE
	.align 2, 0
_08000D90: .4byte 0x020228A8
_08000D94:
	asrs r0, r1, #1
	lsls r0, r0, #1
	ldr r1, _08000DBC @ =0x020228A8
	adds r1, r0, r1
	adds r2, r3, #0
	cmp r2, #0
	bge _08000DA4
	adds r2, #3
_08000DA4:
	lsls r2, r2, #9
	lsrs r2, r2, #0xb
	adds r0, r4, #0
	bl sub_80D636C
_08000DAE:
	ldr r1, _08000DC0 @ =0x0300000D
	movs r0, #1
	strb r0, [r1]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08000DBC: .4byte 0x020228A8
_08000DC0: .4byte 0x0300000D

