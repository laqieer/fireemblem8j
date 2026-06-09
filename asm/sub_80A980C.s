	.syntax unified
	.set InvalidateSuspendSave, 0x080AA438 + 1
	.set IsValidSuspendSave, 0x080AA7C0 + 1
	.set ReadSuspendSavePlaySt, 0x080AA814 + 1
	.set sub_80A79D8, 0x080A79D8 + 1
	.section .text.sub_80A980C, "ax", %progbits
@ sub_80A980C @ JP 0x080A980C - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_80A980C
	.thumb_func
sub_80A980C:
	push {r4, r5, lr}
	sub sp, #0x5c
	adds r5, r0, #0
	movs r0, #3
	bl IsValidSuspendSave
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _080A9834
	add r4, sp, #0x10
	movs r0, #3
	adds r1, r4, #0
	bl ReadSuspendSavePlaySt
	ldrb r0, [r4, #0xc]
	cmp r0, r5
	bne _080A9834
	movs r0, #3
	bl InvalidateSuspendSave
_080A9834:
	mov r1, sp
	movs r0, #0xff
	strb r0, [r1, #6]
	mov r0, sp
	adds r1, r5, #0
	bl sub_80A79D8
	add sp, #0x5c
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0

