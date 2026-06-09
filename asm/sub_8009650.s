	.syntax unified
	.set AP_Update, 0x080091AC + 1
	.set Proc_End, 0x08002CBC + 1
	.section .text.sub_8009650, "ax", %progbits
@ sub_8009650 @ JP 0x08009650 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_8009650
	.thumb_func
sub_8009650:
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, [r4, #0x50]
	ldr r1, [r4, #0x54]
	ldr r2, [r4, #0x58]
	bl AP_Update
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _08009676
	ldr r0, [r4, #0x50]
	cmp r0, #0
	beq _08009670
	ldr r0, [r0]
	cmp r0, #0
	bne _08009676
_08009670:
	adds r0, r4, #0
	bl Proc_End
_08009676:
	pop {r4}
	pop {r0}
	bx r0

