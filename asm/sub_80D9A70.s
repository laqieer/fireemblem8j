	.syntax unified
	.set _Balloc, 0x080D9968 + 1
	.set __divsi3, 0x080D65F8 + 1
	.set sub_80D99D8, 0x080D99D8 + 1
	.section .text.sub_80D9A70, "ax", %progbits
@ _s2b @ JP 0x080D9A70 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global _s2b
	.thumb_func
_s2b:
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	adds r7, r0, #0
	adds r4, r1, #0
	adds r6, r2, #0
	mov r8, r3
	mov r0, r8
	adds r0, #8
	movs r1, #9
	bl __divsi3
	movs r1, #0
	movs r2, #1
	cmp r0, #1
	ble _080D9A98
_080D9A90:
	lsls r2, r2, #1
	adds r1, #1
	cmp r0, r2
	bgt _080D9A90
_080D9A98:
	adds r0, r7, #0
	bl _Balloc
	adds r1, r0, #0
	ldr r0, [sp, #0x18]
	str r0, [r1, #0x14]
	movs r0, #1
	str r0, [r1, #0x10]
	movs r5, #9
	cmp r6, #9
	ble _080D9ACA
	adds r4, #9
_080D9AB0:
	ldrb r3, [r4]
	subs r3, #0x30
	adds r4, #1
	adds r0, r7, #0
	movs r2, #0xa
	bl sub_80D99D8
	adds r1, r0, #0
	adds r5, #1
	cmp r5, r6
	blt _080D9AB0
	adds r4, #1
	b _080D9ACC
_080D9ACA:
	adds r4, #0xa
_080D9ACC:
	cmp r5, r8
	bge _080D9AEA
	mov r0, r8
	subs r5, r0, r5
_080D9AD4:
	ldrb r3, [r4]
	subs r3, #0x30
	adds r4, #1
	adds r0, r7, #0
	movs r2, #0xa
	bl sub_80D99D8
	adds r1, r0, #0
	subs r5, #1
	cmp r5, #0
	bne _080D9AD4
_080D9AEA:
	adds r0, r1, #0
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7, pc}
	.align 2, 0

