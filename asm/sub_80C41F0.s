	.syntax unified
	.set Proc_Find, 0x08002DEC + 1
	.set sub_80C415C, 0x080C415C + 1
	.section .text.sub_80C41F0, "ax", %progbits
@ sub_80C41F0 @ JP 0x080C41F0 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_80C41F0
	.thumb_func
sub_80C41F0:
	push {r4, r5, r6, lr}
	mov r6, sl
	mov r5, sb
	mov r4, r8
	push {r4, r5, r6}
	sub sp, #0x20
	adds r4, r0, #0
	adds r5, r1, #0
	adds r6, r2, #0
	ldr r0, [sp, #0x3c]
	ldr r2, [sp, #0x40]
	lsls r4, r4, #0x10
	asrs r4, r4, #0x10
	lsls r5, r5, #0x10
	asrs r5, r5, #0x10
	lsls r6, r6, #0x10
	asrs r6, r6, #0x10
	lsls r3, r3, #0x10
	asrs r3, r3, #0x10
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	mov r8, r0
	lsls r2, r2, #0x10
	asrs r2, r2, #0x10
	mov sb, r2
	ldr r0, _080C4270 @ =0x08AC1108
	mov sl, r0
	str r3, [sp, #0x1c]
	bl Proc_Find
	adds r1, r0, #0
	adds r0, #0x30
	str r0, [sp]
	movs r2, #1
	str r2, [sp, #4]
	mov r0, sp
	strh r2, [r0, #8]
	strh r4, [r0, #0xa]
	strh r5, [r0, #0xc]
	strh r6, [r0, #0xe]
	ldr r3, [sp, #0x1c]
	strh r3, [r0, #0x10]
	mov r2, r8
	str r2, [sp, #0x14]
	mov r2, sb
	strh r2, [r0, #0x18]
	bl sub_80C415C
	mov r0, sl
	bl Proc_Find
	ldr r1, [r0, #0x50]
	adds r1, #0x32
	ldrb r0, [r1]
	subs r0, #1
	strb r0, [r1]
	add sp, #0x20
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_080C4270: .4byte 0x08AC1108

