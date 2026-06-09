	.syntax unified
	.set sub_80D636C, 0x080D636C + 1
	.set sub_80D6370, 0x080D6370 + 1
	.section .text.sub_80149B4, "ax", %progbits
@ sub_80149B4 @ JP 0x080149B4 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_80149B4
	.thumb_func
sub_80149B4:
	push {r4, lr}
	adds r4, r0, #0
	adds r3, r2, #0
	movs r0, #0x1f
	ands r0, r3
	cmp r0, #0
	beq _080149D2
	lsrs r2, r3, #0x1f
	adds r2, r3, r2
	lsls r2, r2, #0xa
	lsrs r2, r2, #0xb
	adds r0, r4, #0
	bl sub_80D6370
	b _080149E4
_080149D2:
	adds r2, r3, #0
	cmp r2, #0
	bge _080149DA
	adds r2, #3
_080149DA:
	lsls r2, r2, #9
	lsrs r2, r2, #0xb
	adds r0, r4, #0
	bl sub_80D636C
_080149E4:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0

