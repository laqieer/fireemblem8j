	.syntax unified
	.set Proc_Goto, 0x08002E74 + 1
	.set TryUnlockProc, 0x0809A040 + 1
	.section .text.sub_80065AC, "ax", %progbits
@ sub_80065AC @ JP 0x080065AC - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_80065AC
	.thumb_func
sub_80065AC:
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, [r4, #0x2c]
	ldr r1, [r0, #0x48]
	cmp r1, #0
	beq _080065D0
	ldr r0, [r4, #0x30]
	ldrb r0, [r0, #0x18]
	strh r0, [r1, #0x30]
	ldr r0, [r4, #0x2c]
	ldr r0, [r0, #0x48]
	movs r1, #0
	bl Proc_Goto
	ldr r0, [r4, #0x2c]
	ldr r0, [r0, #0x48]
	bl TryUnlockProc
_080065D0:
	ldr r0, [r4, #0x2c]
	ldr r0, [r0, #0x44]
	cmp r0, #0
	beq _080065DC
	bl TryUnlockProc
_080065DC:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0

