	.syntax unified
	.set Proc_Find, 0x08002DEC + 1
	.set m4aSongNumStart, 0x080D4EF4 + 1
	.section .text.sub_808AF88, "ax", %progbits
@ sub_808AF88 @ JP 0x0808AF88 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_808AF88
	.thumb_func
sub_808AF88:
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, _0808AFC0 @ =0x08A72BD8
	bl Proc_Find
	cmp r0, #0
	beq _0808AF9E
	adds r1, r0, #0
	adds r1, #0x28
	movs r0, #1
	strb r0, [r1]
_0808AF9E:
	adds r0, r4, #0
	adds r0, #0x52
	ldrb r0, [r0]
	cmp r0, #0
	bne _0808AFBA
	ldr r0, _0808AFC4 @ =0x0202BCEC
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt _0808AFBA
	movs r0, #0x70
	bl m4aSongNumStart
_0808AFBA:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0808AFC0: .4byte 0x08A72BD8
_0808AFC4: .4byte 0x0202BCEC

