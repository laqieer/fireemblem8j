	.syntax unified
	.set BG_EnableSyncByMask, 0x08001EFC + 1
	.set PutText, 0x08003DA0 + 1
	.set sub_8003CF8, 0x08003CF8 + 1
	.set sub_8003D84, 0x08003D84 + 1
	.set sub_8003D90, 0x08003D90 + 1
	.set sub_8009FA8, 0x08009FA8 + 1
	.set sub_80BB240, 0x080BB240 + 1
	.section .text.sub_80BBD80, "ax", %progbits
@ sub_80BBD80 @ JP 0x080BBD80 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_80BBD80
	.thumb_func
sub_80BBD80:
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	adds r6, r0, #0
	ldr r4, _080BBE00 @ =0x08AC0B90
	ldr r0, [r4]
	str r0, [r6, #0x48]
	movs r1, #4
	str r1, [r6, #0x40]
	str r1, [r6, #0x3c]
	movs r1, #0
	bl sub_8003D84
	ldr r0, [r6, #0x48]
	movs r1, #0
	bl sub_8003D90
	movs r5, #0
	mov r8, r4
	movs r7, #0xc0
	lsls r7, r7, #1
_080BBDAA:
	lsls r4, r5, #3
	mov r1, r8
	ldr r0, [r1]
	adds r0, r0, r4
	bl sub_8003CF8
	mov r1, r8
	ldr r0, [r1]
	adds r0, r0, r4
	ldr r1, _080BBE04 @ =0x02022CAC
	adds r1, r7, r1
	bl PutText
	adds r7, #0x80
	adds r5, #1
	cmp r5, #4
	ble _080BBDAA
	movs r0, #1
	bl BG_EnableSyncByMask
	ldr r2, [r6, #0x30]
	ldr r0, [r2, #0xc]
	movs r1, #4
	ands r0, r1
	cmp r0, #0
	beq _080BBDEC
	ldr r0, [r2]
	ldrb r0, [r0, #4]
	bl sub_80BB240
	str r0, [r6, #0x44]
	cmp r0, #0
	bne _080BBDF6
_080BBDEC:
	ldr r0, [r6, #0x2c]
	ldr r0, [r0, #4]
	bl sub_8009FA8
	str r0, [r6, #0x44]
_080BBDF6:
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080BBE00: .4byte 0x08AC0B90
_080BBE04: .4byte 0x02022CAC

