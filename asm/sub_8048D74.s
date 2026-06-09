	.syntax unified
	.set Sio_SetSubState, 0x08042904 + 1
	.set sub_8002DE4, 0x08002DE4 + 1
	.set sub_8042720, 0x08042720 + 1
	.set sub_808B1F4, 0x0808B1F4 + 1
	.set sub_808B2A4, 0x0808B2A4 + 1
	.set sub_808BB14, 0x0808BB14 + 1
	.section .text.sub_8048D74, "ax", %progbits
@ sub_8048D74 @ JP 0x08048D74 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_8048D74
	.thumb_func
sub_8048D74:
	push {r4, lr}
	sub sp, #4
	adds r4, r0, #0
	ldr r0, _08048DB4 @ =0x02000C1C
	ldr r2, _08048DB8 @ =sub_8048D60
	mov r1, sp
	bl sub_8042720
	lsls r0, r0, #0x10
	cmp r0, #0
	beq _08048DAC
	bl sub_808B2A4
	movs r0, #0
	bl Sio_SetSubState
	ldr r0, _08048DBC @ =0x06016800
	movs r1, #0xd
	bl sub_808BB14
	movs r0, #0x40
	movs r1, #0x48
	movs r2, #0x6a
	bl sub_808B1F4
	adds r0, r4, #0
	bl sub_8002DE4
_08048DAC:
	add sp, #4
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08048DB4: .4byte 0x02000C1C
_08048DB8: .4byte 0x08048D61  @ sub_8048D60
_08048DBC: .4byte 0x06016800

