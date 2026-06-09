	.syntax unified
	.set GetBanimDragonStatusType, 0x08072060 + 1
	.set sub_80734BC, 0x080734BC + 1
	.section .text.sub_8072088, "ax", %progbits
@ sub_8072088 @ JP 0x08072088 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_8072088
	.thumb_func
sub_8072088:
	push {r4, r5, lr}
	sub sp, #0x10
	adds r4, r0, #0
	adds r5, r1, #0
	bl GetBanimDragonStatusType
	cmp r0, #0
	beq _080720CC
	bl GetBanimDragonStatusType
	cmp r0, #3
	beq _080720CC
	asrs r2, r4, #3
	asrs r4, r5, #3
	ldr r0, _080720D4 @ =0x02019790
	movs r1, #1
	rsbs r1, r1, #0
	lsls r2, r2, #1
	lsls r3, r4, #5
	adds r3, r3, r4
	lsls r3, r3, #2
	ldr r4, _080720D8 @ =0x0201D428
	adds r3, r3, r4
	adds r2, r2, r3
	movs r3, #0x20
	str r3, [sp]
	str r3, [sp, #4]
	movs r3, #6
	str r3, [sp, #8]
	movs r3, #0
	str r3, [sp, #0xc]
	movs r3, #0x42
	bl sub_80734BC
_080720CC:
	add sp, #0x10
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_080720D4: .4byte 0x02019790
_080720D8: .4byte 0x0201D428

