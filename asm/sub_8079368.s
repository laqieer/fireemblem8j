	.syntax unified
	.set sub_8002DE4, 0x08002DE4 + 1
	.set sub_8012E84, 0x08012E84 + 1
	.set sub_80720DC, 0x080720DC + 1
	.set sub_8078EF4, 0x08078EF4 + 1
	.section .text.sub_8079368, "ax", %progbits
@ sub_8079368 @ JP 0x08079368 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_8079368
	.thumb_func
sub_8079368:
	push {r4, r5, r6, lr}
	sub sp, #4
	adds r6, r0, #0
	movs r2, #0x14
	rsbs r2, r2, #0
	ldr r3, [r6, #0x54]
	movs r4, #5
	str r4, [sp]
	movs r0, #5
	movs r1, #0
	bl sub_8012E84
	ldr r5, _080793D0 @ =0x03004F98
	str r0, [r5]
	movs r2, #0xa
	rsbs r2, r2, #0
	ldr r3, [r6, #0x54]
	str r4, [sp]
	movs r0, #5
	movs r1, #0
	bl sub_8012E84
	ldr r4, _080793D4 @ =0x03004FA0
	str r0, [r4]
	ldr r0, _080793D8 @ =0x0201FB0C
	ldr r0, [r0]
	movs r1, #0
	bl sub_80720DC
	ldr r2, _080793DC @ =0x02000028
	ldr r0, [r6, #0x58]
	ldr r1, [r5]
	adds r0, r0, r1
	strh r0, [r2]
	ldr r2, _080793E0 @ =0x0200002C
	ldr r0, [r6, #0x5c]
	ldr r1, [r4]
	adds r0, r0, r1
	strh r0, [r2]
	ldr r0, [r6, #0x4c]
	bl sub_8078EF4
	ldr r0, [r6, #0x54]
	cmp r0, #4
	ble _080793E4
	movs r0, #0
	str r0, [r6, #0x54]
	adds r0, r6, #0
	bl sub_8002DE4
	b _080793E8
	.align 2, 0
_080793D0: .4byte 0x03004F98
_080793D4: .4byte 0x03004FA0
_080793D8: .4byte 0x0201FB0C
_080793DC: .4byte 0x02000028
_080793E0: .4byte 0x0200002C
_080793E4:
	adds r0, #1
	str r0, [r6, #0x54]
_080793E8:
	add sp, #4
	pop {r4, r5, r6}
	pop {r0}
	bx r0

