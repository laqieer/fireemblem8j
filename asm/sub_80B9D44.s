	.syntax unified
	.set IsItemDisplayUsable, 0x08016C8C + 1
	.set PutNumber, 0x08004A90 + 1
	.set sub_80043B8, 0x080043B8 + 1
	.set sub_8009FA8, 0x08009FA8 + 1
	.set sub_80165F0, 0x080165F0 + 1
	.set sub_80B9DEC, 0x080B9DEC + 1
	.set sub_80B9E00, 0x080B9E00 + 1
	.section .text.sub_80B9D44, "ax", %progbits
@ sub_80B9D44 @ JP 0x080B9D44 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_80B9D44
	.thumb_func
sub_80B9D44:
	push {r4, r5, r6, lr}
	adds r6, r0, #0
	adds r5, r1, #0
	adds r0, r2, #0
	adds r4, r3, #0
	bl IsItemDisplayUsable
	adds r2, r0, #0
	lsls r2, r2, #0x18
	asrs r2, r2, #0x18
	adds r0, r6, #0
	adds r1, r5, #0
	adds r3, r4, #0
	bl sub_80165F0
	adds r0, r5, #0
	bl sub_80B9E00
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _080B9D86
	adds r4, #0x22
	adds r0, r5, #0
	bl sub_80B9DEC
	adds r2, r0, #0
	lsls r2, r2, #0x10
	lsrs r2, r2, #0x10
	adds r0, r4, #0
	movs r1, #2
	bl PutNumber
	b _080B9D98
_080B9D86:
	ldr r0, _080B9DA0 @ =0x000004C7
	bl sub_8009FA8
	adds r3, r0, #0
	adds r0, r6, #0
	movs r1, #0x5c
	movs r2, #2
	bl sub_80043B8
_080B9D98:
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_080B9DA0: .4byte 0x000004C7

