	.syntax unified
	.set GetWeaponLevelFromExp, 0x08016B04 + 1
	.set sub_8009FA8, 0x08009FA8 + 1
	.section .text.sub_8016B3C, "ax", %progbits
@ sub_8016B3C @ JP 0x08016B3C - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_8016B3C
	.thumb_func
sub_8016B3C:
	push {r4, r5, lr}
	sub sp, #0x20
	mov r2, sp
	ldr r1, _08016B78 @ =0x080DC630
	ldm r1!, {r3, r4, r5}
	stm r2!, {r3, r4, r5}
	ldm r1!, {r3, r4, r5}
	stm r2!, {r3, r4, r5}
	ldm r1!, {r3, r4}
	stm r2!, {r3, r4}
	movs r1, #0xff
	ands r0, r1
	lsls r1, r0, #3
	adds r1, r1, r0
	lsls r1, r1, #2
	ldr r0, _08016B7C @ =0x0885E068
	adds r1, r1, r0
	ldrb r4, [r1, #0x1c]
	ldr r0, [r1, #8]
	ldr r1, _08016B80 @ =0x003D3C00
	ands r0, r1
	cmp r0, #0
	beq _08016B84
	adds r0, r4, #0
	bl GetWeaponLevelFromExp
	cmp r0, #0
	bne _08016B84
	movs r4, #7
	b _08016B8C
	.align 2, 0
_08016B78: .4byte 0x080DC630
_08016B7C: .4byte 0x0885E068
_08016B80: .4byte 0x003D3C00
_08016B84:
	adds r0, r4, #0
	bl GetWeaponLevelFromExp
	adds r4, r0, #0
_08016B8C:
	lsls r0, r4, #2
	add r0, sp
	ldr r0, [r0]
	bl sub_8009FA8
	add sp, #0x20
	pop {r4, r5}
	pop {r1}
	bx r1
	.align 2, 0

