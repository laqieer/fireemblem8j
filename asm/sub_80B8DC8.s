	.syntax unified
	.set MakeNewItem, 0x080162E8 + 1
	.set Proc_StartBlocking, 0x08002C30 + 1
	.set sub_8002BCC, 0x08002BCC + 1
	.set sub_808F44C, 0x0808F44C + 1
	.set sub_80B8E3C, 0x080B8E3C + 1
	.section .text.sub_80B8DC8, "ax", %progbits
@ sub_80B8DC8 @ JP 0x080B8DC8 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_80B8DC8
	.thumb_func
sub_80B8DC8:
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	mov r8, r0
	adds r6, r1, #0
	adds r4, r3, #0
	lsls r2, r2, #0x18
	lsrs r5, r2, #0x18
	bl sub_808F44C
	cmp r4, #0
	beq _080B8DF0
	ldr r0, _080B8DEC @ =0x08ABC808
	adds r1, r4, #0
	bl Proc_StartBlocking
	b _080B8DF8
	.align 2, 0
_080B8DEC: .4byte 0x08ABC808
_080B8DF0:
	ldr r0, _080B8E34 @ =0x08ABC808
	movs r1, #3
	bl sub_8002BCC
_080B8DF8:
	adds r7, r0, #0
	adds r0, r7, #0
	adds r0, #0x61
	strb r5, [r0]
	mov r0, r8
	str r0, [r7, #0x2c]
	ldr r5, _080B8E38 @ =0x08ABC768
	cmp r6, #0
	beq _080B8E0C
	adds r5, r6, #0
_080B8E0C:
	adds r4, r7, #0
	adds r4, #0x30
	movs r6, #0x14
_080B8E12:
	ldrh r0, [r5]
	adds r5, #2
	bl MakeNewItem
	strh r0, [r4]
	adds r4, #2
	subs r6, #1
	cmp r6, #0
	bge _080B8E12
	adds r0, r7, #0
	bl sub_80B8E3C
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080B8E34: .4byte 0x08ABC808
_080B8E38: .4byte 0x08ABC768

