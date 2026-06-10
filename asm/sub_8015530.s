	.syntax unified
	.set CheckFlag, 0x080860D0 + 1
	.set Proc_StartBlocking, 0x08002C30 + 1
	.section .text.sub_8015530, "ax", %progbits
@ sub_8015530 @ JP 0x08015530 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_8015530
	.thumb_func
sub_8015530:
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, _08015560 @ =0x0202BCEC
	ldrb r0, [r0, #0xe]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #0x38
	beq _08015558
	cmp r0, #6
	bne _08015550
	movs r0, #0x88
	bl CheckFlag
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _08015558
_08015550:
	ldr r0, _08015564 @ =0x085C3630
	adds r1, r4, #0
	bl Proc_StartBlocking
_08015558:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08015560: .4byte 0x0202BCEC
_08015564: .4byte 0x085C3630

