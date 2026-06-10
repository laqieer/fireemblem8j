	.syntax unified
	.set Proc_Goto, 0x08002E74 + 1
	.set sub_8002DE4, 0x08002DE4 + 1
	.set sub_8043084, 0x08043084 + 1
	.set sub_8045C5C, 0x08045C5C + 1
	.set sub_8045C80, 0x08045C80 + 1
	.set sub_8045C8C, 0x08045C8C + 1
	.set sub_8045EA4, 0x08045EA4 + 1
	.set sub_804D08C, 0x0804D08C + 1
	.section .text.sub_8046114, "ax", %progbits
@ sub_8046114 @ JP 0x08046114 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_8046114
	.thumb_func
sub_8046114:
	push {r4, lr}
	adds r4, r0, #0
	bl sub_8045C8C
	ldr r1, _0804616C @ =0x0203DD24
	ldr r0, [r1]
	adds r3, r0, #1
	str r3, [r1]
	ldr r0, _08046170 @ =0x0203DA20
	adds r0, #0xa0
	ldr r1, _08046174 @ =0x085D31E8
	ldr r2, [r1]
	ldrb r0, [r0]
	ldrb r1, [r2, #7]
	cmp r0, r1
	bne _0804613C
	movs r0, #0x96
	lsls r0, r0, #2
	cmp r3, r0
	ble _0804617C
_0804613C:
	bl sub_8045C5C
	bl sub_8045C80
	adds r0, r4, #0
	bl sub_8045EA4
	movs r0, #0
	str r0, [r4, #0x30]
	ldr r0, _08046178 @ =0x000006D3
	movs r1, #1
	bl sub_8043084
	movs r0, #0xc0
	movs r1, #0x10
	adds r2, r4, #0
	bl sub_804D08C
	adds r0, r4, #0
	movs r1, #3
	bl Proc_Goto
	b _0804619C
	.align 2, 0
_0804616C: .4byte 0x0203DD24
_08046170: .4byte 0x0203DA20
_08046174: .4byte 0x085D31E8
_08046178: .4byte 0x000006D3
_0804617C:
	movs r0, #6
	ldrsb r0, [r2, r0]
	cmp r0, #0
	bne _080461A4
	ldr r1, [r4, #0x34]
	movs r0, #0x8c
	muls r0, r1, r0
	adds r0, r2, r0
	movs r1, #0x9a
	lsls r1, r1, #1
	adds r0, r0, r1
	ldrb r0, [r0]
	ldrb r1, [r2, #9]
	ands r0, r1
	cmp r0, r1
	bne _080461AA
_0804619C:
	adds r0, r4, #0
	bl sub_8002DE4
	b _080461AA
_080461A4:
	adds r0, r4, #0
	bl sub_8002DE4
_080461AA:
	pop {r4}
	pop {r0}
	bx r0

