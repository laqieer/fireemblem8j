	.syntax unified
	.set Proc_Find, 0x08002DEC + 1
	.set sub_8002BCC, 0x08002BCC + 1
	.section .text.sub_80BEF48, "ax", %progbits
@ sub_80BEF48 @ JP 0x080BEF48 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_80BEF48
	.thumb_func
sub_80BEF48:
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	adds r5, r0, #0
	adds r4, r1, #0
	adds r6, r2, #0
	mov r8, r3
	ldr r7, [sp, #0x18]
	lsls r4, r4, #0x18
	lsrs r4, r4, #0x18
	ldr r0, _080BEF8C @ =0x08AC1108
	bl Proc_Find
	adds r1, r0, #0
	ldr r0, _080BEF90 @ =0x08AC16C8
	bl sub_8002BCC
	str r5, [r0, #0x2c]
	adds r1, r0, #0
	adds r1, #0x30
	strb r4, [r1]
	str r6, [r0, #0x34]
	mov r1, r8
	str r1, [r0, #0x40]
	str r7, [r0, #0x38]
	ldr r1, [sp, #0x1c]
	str r1, [r0, #0x3c]
	ldr r1, [sp, #0x20]
	str r1, [r0, #0x44]
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080BEF8C: .4byte 0x08AC1108
_080BEF90: .4byte 0x08AC16C8

