	.syntax unified
	.set PutText, 0x08003DA0 + 1
	.set sub_8003D84, 0x08003D84 + 1
	.set sub_8003E0C, 0x08003E0C + 1
	.set sub_8003F28, 0x08003F28 + 1
	.section .text.sub_8014C7C, "ax", %progbits
@ sub_8014C7C @ JP 0x08014C7C - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_8014C7C
	.thumb_func
sub_8014C7C:
	push {r4, r5, r6, lr}
	mov r6, sb
	mov r5, r8
	push {r5, r6}
	adds r6, r0, #0
	mov sb, r1
	adds r5, r2, #0
	mov r8, r3
	ldr r4, [sp, #0x18]
	mov r0, r8
	bl sub_8003E0C
	adds r1, r0, #0
	lsls r4, r4, #3
	subs r4, r4, r1
	asrs r1, r4, #1
	adds r0, r6, #0
	bl sub_8003D84
	adds r0, r6, #0
	mov r1, r8
	bl sub_8003F28
	lsls r5, r5, #5
	add r5, sb
	lsls r5, r5, #1
	ldr r0, _08014CC8 @ =0x02022CA8
	adds r5, r5, r0
	adds r0, r6, #0
	adds r1, r5, #0
	bl PutText
	pop {r3, r4}
	mov r8, r3
	mov sb, r4
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_08014CC8: .4byte 0x02022CA8

