	.syntax unified
	.set sub_80D6370, 0x080D6370 + 1
	.section .text.sub_804F098, "ax", %progbits
@ sub_804F098 @ JP 0x0804F098 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_804F098
	.thumb_func
sub_804F098:
	push {r4, r5, r6, r7, lr}
	mov r7, sb
	mov r6, r8
	push {r6, r7}
	sub sp, #4
	adds r5, r0, #0
	ldr r0, [sp, #0x20]
	lsls r3, r3, #1
	lsls r2, r2, #5
	adds r2, r2, r1
	lsls r2, r2, #1
	adds r5, r5, r2
	cmp r0, #0
	ble _0804F0DE
	mov r7, sp
	adds r4, r0, #0
	movs r0, #0
	mov sb, r0
	lsls r0, r3, #0xa
	lsrs r6, r0, #0xb
	movs r0, #0x80
	lsls r0, r0, #0x11
	mov r8, r0
_0804F0C6:
	mov r0, sb
	strh r0, [r7]
	mov r0, sp
	adds r1, r5, #0
	mov r2, r8
	orrs r2, r6
	bl sub_80D6370
	adds r5, #0x40
	subs r4, #1
	cmp r4, #0
	bne _0804F0C6
_0804F0DE:
	add sp, #4
	pop {r3, r4}
	mov r8, r3
	mov sb, r4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0

