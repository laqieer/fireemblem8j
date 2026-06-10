	.syntax unified
	.set GetUnit, 0x08019108 + 1
	.set InitUnits, 0x0801756C + 1
	.set Proc_End, 0x08002CBC + 1
	.set nullsub_2, 0x0804D148 + 1
	.set sub_8089078, 0x08089078 + 1
	.set sub_809445C, 0x0809445C + 1
	.set sub_80AB354, 0x080AB354 + 1
	.section .text.sub_8043C74, "ax", %progbits
@ sub_8043C74 @ JP 0x08043C74 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_8043C74
	.thumb_func
sub_8043C74:
	push {r4, lr}
	sub sp, #0x10
	adds r4, r0, #0
	ldr r0, [r4, #0x2c]
	bl Proc_End
	bl nullsub_2
	bl sub_8089078
	bl InitUnits
	movs r0, #1
	bl GetUnit
	adds r1, r0, #0
	ldr r3, _08043CB8 @ =0x0203DB78
	ldr r2, [r4, #0x40]
	lsls r0, r2, #2
	adds r0, r0, r2
	lsls r0, r0, #2
	adds r0, r0, r3
	ldrb r0, [r0, #0xf]
	mov r2, sp
	bl sub_80AB354
	adds r0, r4, #0
	bl sub_809445C
	add sp, #0x10
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08043CB8: .4byte 0x0203DB78

