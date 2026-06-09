	.syntax unified
	.set sub_800493C, 0x0800493C + 1
	.section .text.AddSpecialChar, "ax", %progbits
@ AddSpecialChar @ JP 0x08004998 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global AddSpecialChar
	.thumb_func
AddSpecialChar:
	push {r4, r5, lr}
	adds r5, r0, #0
	strb r1, [r5]
	strb r2, [r5, #1]
	ldr r0, _080049CC @ =0x02028E70
	ldr r3, [r0]
	ldrh r4, [r3, #0x12]
	adds r0, r4, #1
	strh r0, [r3, #0x12]
	strh r4, [r5, #2]
	movs r0, #0xff
	strb r0, [r5, #4]
	movs r3, #2
	ldrsh r0, [r5, r3]
	ldr r3, _080049D0 @ =0x08593ECC
	lsls r2, r2, #2
	adds r2, r2, r3
	ldr r2, [r2]
	bl sub_800493C
	movs r1, #2
	ldrsh r0, [r5, r1]
	pop {r4, r5}
	pop {r1}
	bx r1
	.align 2, 0
_080049CC: .4byte 0x02028E70
_080049D0: .4byte 0x08593ECC

