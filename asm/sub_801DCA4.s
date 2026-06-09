	.syntax unified
	.set sub_801F9FC, 0x0801F9FC + 1
	.set sub_801FA0C, 0x0801FA0C + 1
	.set sub_8031568, 0x08031568 + 1
	.section .text.sub_801DCA4, "ax", %progbits
@ sub_801DCA4 @ JP 0x0801DCA4 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_801DCA4
	.thumb_func
sub_801DCA4:
	push {r4, lr}
	adds r4, r0, #0
	bl sub_8031568
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _0801DCE0
	ldr r0, _0801DCC8 @ =0x02001F70
	ldrb r0, [r0]
	cmp r0, #0x63
	bhi _0801DCD0
	ldr r0, _0801DCCC @ =0x0203A954
	ldrh r1, [r0, #6]
	adds r0, r4, #0
	bl sub_801FA0C
	b _0801DCEA
	.align 2, 0
_0801DCC8: .4byte 0x02001F70
_0801DCCC: .4byte 0x0203A954
_0801DCD0:
	ldr r0, _0801DCDC @ =0x0203A954
	ldrh r1, [r0, #6]
	adds r0, r4, #0
	bl sub_801F9FC
	b _0801DCEA
	.align 2, 0
_0801DCDC: .4byte 0x0203A954
_0801DCE0:
	ldr r0, _0801DCF0 @ =0x0203A954
	ldrh r1, [r0, #6]
	adds r0, r4, #0
	bl sub_801F9FC
_0801DCEA:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0801DCF0: .4byte 0x0203A954

