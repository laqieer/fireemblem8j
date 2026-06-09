	.syntax unified
	.set sub_8000D68, 0x08000D68 + 1
	.set sub_8013008, 0x08013008 + 1
	.set sub_807DD40, 0x0807DD40 + 1
	.section .text.sub_807DE2C, "ax", %progbits
@ sub_807DE2C @ JP 0x0807DE2C - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_807DE2C
	.thumb_func
sub_807DE2C:
	push {r4, lr}
	adds r4, r0, #0
	movs r0, #0x20
	bl sub_807DD40
	ldr r1, _0807DE50 @ =0x06000560
	adds r0, r4, #0
	bl sub_8013008
	ldr r0, _0807DE54 @ =0x08A99FA8
	movs r1, #0xa0
	movs r2, #0x20
	bl sub_8000D68
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0807DE50: .4byte 0x06000560
_0807DE54: .4byte 0x08A99FA8

