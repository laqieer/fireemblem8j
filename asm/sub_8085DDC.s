	.syntax unified
	.section .text.sub_8085DDC, "ax", %progbits
@ sub_8085DDC @ JP 0x08085DDC - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_8085DDC
	.thumb_func
sub_8085DDC:
	push {r4, r5, r6, r7, lr}
	adds r4, r0, #0
	ldr r0, _08085E40 @ =0x03004DF0
	ldr r0, [r0]
	movs r2, #0x10
	ldrsb r2, [r0, r2]
	mov ip, r2
	movs r3, #0x11
	ldrsb r3, [r0, r3]
	ldr r0, [r4]
	ldr r1, [r0, #8]
	ldrb r0, [r0, #8]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	adds r6, r0, #0
	movs r0, #0xff
	lsls r0, r0, #8
	ands r0, r1
	lsls r0, r0, #0x10
	asrs r7, r0, #0x18
	movs r0, #0xff
	lsls r0, r0, #0x10
	ands r0, r1
	lsls r0, r0, #8
	asrs r0, r0, #0x18
	adds r5, r0, #0
	asrs r1, r1, #0x18
	cmp r6, r2
	bgt _08085E1A
	cmp r2, r0
	ble _08085E22
_08085E1A:
	cmp r5, ip
	bgt _08085E44
	cmp ip, r6
	bgt _08085E44
_08085E22:
	cmp r7, r3
	bgt _08085E2A
	cmp r3, r1
	ble _08085E32
_08085E2A:
	cmp r1, r3
	bgt _08085E44
	cmp r3, r7
	bgt _08085E44
_08085E32:
	ldr r0, [r4]
	ldr r1, [r0, #4]
	str r1, [r4, #4]
	ldrh r0, [r0, #2]
	str r0, [r4, #8]
	movs r0, #1
	b _08085E46
	.align 2, 0
_08085E40: .4byte 0x03004DF0
_08085E44:
	movs r0, #0
_08085E46:
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1

