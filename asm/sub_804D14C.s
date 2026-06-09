	.syntax unified
	.set sub_80D636C, 0x080D636C + 1
	.section .text.sub_804D14C, "ax", %progbits
@ sub_804D14C @ JP 0x0804D14C - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_804D14C
	.thumb_func
sub_804D14C:
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	adds r6, r0, #0
	adds r5, r1, #0
	lsls r2, r2, #5
	mov r8, r2
	cmp r3, #0
	ble _0804D182
	movs r7, #0x80
	lsls r7, r7, #3
	adds r4, r3, #0
_0804D164:
	mov r2, r8
	cmp r2, #0
	bge _0804D16C
	adds r2, #3
_0804D16C:
	lsls r2, r2, #9
	lsrs r2, r2, #0xb
	adds r0, r6, #0
	adds r1, r5, #0
	bl sub_80D636C
	adds r6, r6, r7
	adds r5, r5, r7
	subs r4, #1
	cmp r4, #0
	bne _0804D164
_0804D182:
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0

