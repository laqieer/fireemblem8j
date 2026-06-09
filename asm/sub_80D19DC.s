	.syntax unified
	.section .text.sub_80D19DC, "ax", %progbits
@ sub_80D19DC @ JP 0x080D19DC - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_80D19DC
	.thumb_func
sub_80D19DC:
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	mov r8, r0
	lsls r2, r2, #0x10
	lsrs r7, r2, #0x10
	adds r4, r1, #2
	movs r2, #0xff
	ldr r0, [r1]
	ldrb r6, [r1]
	lsrs r1, r0, #8
	ands r1, r2
	cmp r1, #0xc
	ble _080D1A2C
	lsls r0, r6, #0x10
	mov ip, r0
_080D19FC:
	lsls r0, r1, #6
	mov r2, r8
	adds r3, r2, r0
	adds r0, r6, #0
	subs r2, r1, #1
	cmp r0, #0
	blt _080D1A24
	ldr r0, _080D1A38 @ =0xFFFF0000
	mov r5, ip
	adds r1, r5, r0
	adds r5, r0, #0
_080D1A12:
	ldrh r0, [r4]
	adds r0, r7, r0
	strh r0, [r3]
	adds r4, #2
	adds r3, #2
	adds r0, r1, #0
	adds r1, r1, r5
	cmp r0, #0
	bge _080D1A12
_080D1A24:
	lsls r0, r2, #0x10
	asrs r1, r0, #0x10
	cmp r1, #0xc
	bgt _080D19FC
_080D1A2C:
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080D1A38: .4byte 0xFFFF0000

