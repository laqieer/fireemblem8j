	.syntax unified
	.set sub_8000D68, 0x08000D68 + 1
	.set sub_8013008, 0x08013008 + 1
	.section .text.sub_80ACDE8, "ax", %progbits
@ sub_80ACDE8 @ JP 0x080ACDE8 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_80ACDE8
	.thumb_func
sub_80ACDE8:
	push {r4, lr}
	adds r4, r0, #0
	cmp r4, #0
	bge _080ACDF2
	movs r4, #3
_080ACDF2:
	ldr r0, _080ACE18 @ =0x08A9CB04
	ldr r1, _080ACE1C @ =0x02020188
	bl sub_8013008
	ldr r0, _080ACE20 @ =0x08A9CEDC
	lsls r1, r4, #5
	movs r2, #0x20
	bl sub_8000D68
	ldr r0, _080ACE24 @ =0x08A9CEFC
	adds r1, r4, #1
	lsls r1, r1, #5
	movs r2, #0x20
	bl sub_8000D68
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080ACE18: .4byte 0x08A9CB04
_080ACE1C: .4byte 0x02020188
_080ACE20: .4byte 0x08A9CEDC
_080ACE24: .4byte 0x08A9CEFC

