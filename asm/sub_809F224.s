	.syntax unified
	.set BG_EnableSyncByMask, 0x08001EFC + 1
	.set GetUnitItemCount, 0x08017780 + 1
	.set Proc_Goto, 0x08002E74 + 1
	.set j_TmFillRect, 0x080DC0E4 + 1
	.set sub_80811B4, 0x080811B4 + 1
	.set sub_808BB14, 0x0808BB14 + 1
	.set sub_809DA14, 0x0809DA14 + 1
	.set sub_809E6B4, 0x0809E6B4 + 1
	.set sub_80B1524, 0x080B1524 + 1
	.set sub_80B1FBC, 0x080B1FBC + 1
	.section .text.sub_809F224, "ax", %progbits
@ sub_809F224 @ JP 0x0809F224 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_809F224
	.thumb_func
sub_809F224:
	push {r4, r5, lr}
	ldr r4, [r0, #0x14]
	ldr r0, [r4, #0x2c]
	bl GetUnitItemCount
	adds r5, r0, #0
	ldr r0, _0809F24C @ =0x0202404A
	movs r1, #0xc
	movs r2, #1
	movs r3, #0
	bl j_TmFillRect
	cmp r5, #0
	bne _0809F250
	adds r0, r4, #0
	movs r1, #6
	bl Proc_Goto
	b _0809F26C
	.align 2, 0
_0809F24C: .4byte 0x0202404A
_0809F250:
	ldr r0, [r4, #0x30]
	cmp r0, r5
	blt _0809F25A
	subs r0, #1
	str r0, [r4, #0x30]
_0809F25A:
	ldr r1, [r4, #0x30]
	lsls r1, r1, #4
	adds r1, #0x48
	movs r3, #0x80
	lsls r3, r3, #4
	movs r0, #0x10
	movs r2, #0xb
	bl sub_80B1FBC
_0809F26C:
	ldr r0, _0809F2A0 @ =0x02022EEC
	ldr r1, _0809F2A4 @ =0x02013510
	ldr r2, [r4, #0x2c]
	movs r3, #1
	bl sub_809DA14
	ldr r0, [r4, #0x2c]
	ldr r1, [r4, #0x30]
	bl sub_809E6B4
	movs r0, #0
	bl sub_80B1524
	bl sub_80811B4
	movs r0, #5
	bl BG_EnableSyncByMask
	ldr r0, _0809F2A8 @ =0x06014000
	movs r1, #1
	rsbs r1, r1, #0
	bl sub_808BB14
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_0809F2A0: .4byte 0x02022EEC
_0809F2A4: .4byte 0x02013510
_0809F2A8: .4byte 0x06014000

