	.syntax unified
	.set sub_8003CF8, 0x08003CF8 + 1
	.set sub_8004374, 0x08004374 + 1
	.set sub_8009FA8, 0x08009FA8 + 1
	.section .text.sub_80D2EBC, "ax", %progbits
@ sub_80D2EBC @ JP 0x080D2EBC - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_80D2EBC
	.thumb_func
sub_80D2EBC:
	push {r4, r5, r6, r7, lr}
	sub sp, #8
	adds r5, r0, #0
	adds r6, r1, #0
	adds r7, r2, #0
	ldr r4, _080D2EF4 @ =0x08BABAF4
	lsls r1, r6, #3
	adds r1, #0x7c
	ldr r0, [r4]
	adds r0, r0, r1
	bl sub_8003CF8
	ldr r4, [r4]
	adds r0, r4, #0
	adds r0, #0x30
	ldrb r0, [r0]
	cmp r0, #0
	beq _080D2EFC
	ldr r1, _080D2EF8 @ =0x08BABB30
	adds r0, r4, #0
	adds r0, #0x40
	adds r0, r0, r5
	ldrb r0, [r0]
	lsls r0, r0, #2
	adds r0, r0, r1
	ldr r0, [r0]
	b _080D2F0C
	.align 2, 0
_080D2EF4: .4byte 0x08BABAF4
_080D2EF8: .4byte 0x08BABB30
_080D2EFC:
	ldr r1, _080D2F38 @ =0x08BABB54
	adds r0, r4, #0
	adds r0, #0x54
	adds r0, r0, r5
	ldrb r0, [r0]
	lsls r0, r0, #1
	adds r0, r0, r1
	ldrh r0, [r0]
_080D2F0C:
	bl sub_8009FA8
	adds r3, r0, #0
	ldr r0, _080D2F3C @ =0x08BABAF4
	lsls r1, r6, #3
	adds r1, #0x7c
	ldr r0, [r0]
	adds r0, r0, r1
	lsls r1, r7, #6
	ldr r2, _080D2F40 @ =0x020234AC
	adds r1, r1, r2
	movs r2, #9
	str r2, [sp]
	str r3, [sp, #4]
	movs r2, #0
	movs r3, #0
	bl sub_8004374
	add sp, #8
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080D2F38: .4byte 0x08BABB54
_080D2F3C: .4byte 0x08BABAF4
_080D2F40: .4byte 0x020234AC

