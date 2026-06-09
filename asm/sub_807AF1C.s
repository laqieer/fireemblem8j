	.syntax unified
	.set AP_Update, 0x080091AC + 1
	.set sub_8002100, 0x08002100 + 1
	.set sub_8002DE4, 0x08002DE4 + 1
	.set sub_8012E84, 0x08012E84 + 1
	.set sub_80D6374, 0x080D6374 + 1
	.section .text.sub_807AF1C, "ax", %progbits
@ sub_807AF1C @ JP 0x0807AF1C - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_807AF1C
	.thumb_func
sub_807AF1C:
	push {r4, r5, r6, r7, lr}
	mov r7, sb
	mov r6, r8
	push {r6, r7}
	sub sp, #4
	adds r7, r0, #0
	adds r4, r7, #0
	adds r4, #0x64
	ldrh r0, [r4]
	adds r1, r0, #1
	strh r1, [r4]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #7
	ble _0807AF40
	adds r0, r7, #0
	bl sub_8002DE4
_0807AF40:
	movs r1, #0x80
	lsls r1, r1, #2
	movs r2, #0x80
	lsls r2, r2, #1
	movs r0, #0
	ldrsh r3, [r4, r0]
	movs r0, #8
	str r0, [sp]
	movs r0, #5
	bl sub_8012E84
	mov r8, r0
	ldr r4, _0807AFDC @ =0x080DC15C
	movs r1, #0x80
	adds r1, r1, r4
	mov sb, r1
	movs r2, #0
	ldrsh r0, [r1, r2]
	lsls r0, r0, #4
	mov r1, r8
	bl sub_80D6374
	adds r6, r0, #0
	lsls r6, r6, #0x10
	asrs r6, r6, #0x10
	movs r1, #0
	ldrsh r0, [r4, r1]
	rsbs r0, r0, #0
	lsls r0, r0, #4
	mov r1, r8
	bl sub_80D6374
	adds r5, r0, #0
	lsls r5, r5, #0x10
	asrs r5, r5, #0x10
	movs r2, #0
	ldrsh r0, [r4, r2]
	lsls r0, r0, #4
	mov r1, r8
	bl sub_80D6374
	adds r4, r0, #0
	lsls r4, r4, #0x10
	asrs r4, r4, #0x10
	mov r1, sb
	movs r2, #0
	ldrsh r0, [r1, r2]
	lsls r0, r0, #4
	mov r1, r8
	bl sub_80D6374
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	str r0, [sp]
	movs r0, #0
	adds r1, r6, #0
	adds r2, r5, #0
	adds r3, r4, #0
	bl sub_8002100
	ldr r0, [r7, #0x50]
	ldr r1, [r7, #0x2c]
	subs r1, #8
	ldr r2, [r7, #0x30]
	subs r2, #8
	movs r3, #0xc0
	lsls r3, r3, #2
	orrs r2, r3
	bl AP_Update
	add sp, #4
	pop {r3, r4}
	mov r8, r3
	mov sb, r4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0807AFDC: .4byte 0x080DC15C

