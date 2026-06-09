	.syntax unified
	.set sub_8003CF8, 0x08003CF8 + 1
	.set sub_8003F28, 0x08003F28 + 1
	.set sub_8004374, 0x08004374 + 1
	.set sub_8009FA8, 0x08009FA8 + 1
	.section .text.sub_80D2E44, "ax", %progbits
@ sub_80D2E44 @ JP 0x080D2E44 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_80D2E44
	.thumb_func
sub_80D2E44:
	push {r4, lr}
	sub sp, #8
	ldr r4, _080D2EAC @ =0x08BABAF4
	ldr r1, [r4]
	adds r0, r1, #0
	adds r0, #0x30
	ldrb r0, [r0]
	cmp r0, #0
	bne _080D2EA4
	adds r0, r1, #0
	adds r0, #0xec
	bl sub_8003CF8
	ldr r2, _080D2EB0 @ =0x08BABB54
	ldr r0, [r4]
	adds r1, r0, #0
	adds r1, #0x29
	ldrb r1, [r1]
	lsls r1, r1, #0x18
	asrs r1, r1, #0x18
	adds r0, #0x54
	adds r0, r0, r1
	ldrb r0, [r0]
	lsls r0, r0, #1
	adds r0, r0, r2
	ldrh r0, [r0]
	bl sub_8009FA8
	adds r3, r0, #0
	ldr r0, [r4]
	adds r0, #0xec
	ldr r1, _080D2EB4 @ =0x02023130
	movs r2, #0x16
	str r2, [sp]
	str r3, [sp, #4]
	movs r2, #0
	movs r3, #0
	bl sub_8004374
	ldr r4, [r4]
	adds r4, #0xec
	ldr r0, _080D2EB8 @ =0x00000566
	bl sub_8009FA8
	adds r1, r0, #0
	adds r0, r4, #0
	bl sub_8003F28
_080D2EA4:
	add sp, #8
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080D2EAC: .4byte 0x08BABAF4
_080D2EB0: .4byte 0x08BABB54
_080D2EB4: .4byte 0x02023130
_080D2EB8: .4byte 0x00000566

