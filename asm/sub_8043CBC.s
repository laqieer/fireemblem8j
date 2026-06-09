	.syntax unified
	.set Proc_Find, 0x08002DEC + 1
	.set sub_8002DE4, 0x08002DE4 + 1
	.section .text.sub_8043CBC, "ax", %progbits
@ sub_8043CBC @ JP 0x08043CBC - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_8043CBC
	.thumb_func
sub_8043CBC:
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, _08043CD8 @ =0x08A9360C
	bl Proc_Find
	cmp r0, #0
	bne _08043CD0
	adds r0, r4, #0
	bl sub_8002DE4
_08043CD0:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08043CD8: .4byte 0x08A9360C

