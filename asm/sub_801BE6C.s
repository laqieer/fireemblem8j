	.syntax unified
	.set InitRN, 0x08000BA0 + 1
	.set InitUnits, 0x0801756C + 1
	.set nullsub_14, 0x08009F34 + 1
	.set sub_8000CD8, 0x08000CD8 + 1
	.set sub_8009FA8, 0x08009FA8 + 1
	.set sub_8031160, 0x08031160 + 1
	.set sub_8031438, 0x08031438 + 1
	.set sub_80A98B4, 0x080A98B4 + 1
	.set sub_80A9A28, 0x080A9A28 + 1
	.section .text.sub_801BE6C, "ax", %progbits
@ sub_801BE6C @ JP 0x0801BE6C - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_801BE6C
	.thumb_func
sub_801BE6C:
	push {lr}
	bl sub_8000CD8
	bl InitRN
	bl InitUnits
	movs r3, #1
	rsbs r3, r3, #0
	movs r0, #0
	movs r1, #0
	movs r2, #0
	bl sub_80A98B4
	ldr r0, _0801BEAC @ =0x000001F1
	bl sub_8009FA8
	bl sub_8031438
	ldr r1, _0801BEB0 @ =0x0202BCEC
	movs r0, #1
	strb r0, [r1, #0xe]
	movs r0, #0
	bl sub_80A9A28
	bl sub_8031160
	bl nullsub_14
	movs r0, #2
	pop {r1}
	bx r1
	.align 2, 0
_0801BEAC: .4byte 0x000001F1
_0801BEB0: .4byte 0x0202BCEC

